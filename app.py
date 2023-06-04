import streamlit as st
import psycopg2

# Connect to the PostgreSQL database using pgAdmin credentials
conn = psycopg2.connect(
    host="localhost",
    database="imdb",
    user="postgres",
    password="1308"
)

# Define a function to run SQL queries


def run_query(query):
    cursor = conn.cursor()
    cursor.execute(query)
    result = cursor.fetchall()
    return result

# Define the Streamlit app


def main():
    st.set_page_config(page_title="FilmVerse",
                       page_icon=":smiley:", layout="wide")
    st.markdown("<h1 style='color: black; font-weight: bold;'>FilmVerse</h1>",
                unsafe_allow_html=True)
    # Set the page configuration

    # Add a CSS style to the app
    st.markdown(
        """
        <style>
        .stApp {
            background-image: url('https://drive.google.com/uc?id=1R4rZggPGWlSUfUHFAMdezL5sXh1VnY7G');
            background-repeat: no-repeat;
            background-size: cover;
        }
        .stApp::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background-color: rgba(255, 255, 255, 0.5);
        }
        body {
            color: black;
            font-weight: bold;
        }
        </style>
        """,
        unsafe_allow_html=True
    )

    # Define the dropdown options and their corresponding queries
    queries = {
        "Top 10 Comedy Movies": "SELECT DISTINCT primary_title, start_year, average_rating FROM basics JOIN ratings ON basics.tconst = ratings.tconst WHERE genres = 'Comedy' and average_rating >= 6.0 ORDER BY average_rating DESC LIMIT 10;",
        "Top 10 Short Movies": "SELECT primary_title, start_year, average_rating FROM basics JOIN ratings ON basics.tconst = ratings.tconst WHERE genres = 'Short' ORDER BY average_rating DESC LIMIT 10;",
        "Top 10 Documentary": "SELECT primary_title, start_year, average_rating FROM basics JOIN ratings ON basics.tconst = ratings.tconst WHERE genres = 'Documentary' ORDER BY average_rating DESC LIMIT 10;",
        "Top 10 Drama Movies": "SELECT primary_title, start_year, average_rating FROM basics JOIN ratings ON basics.tconst = ratings.tconst WHERE genres = 'Drama' ORDER BY average_rating DESC LIMIT 10;",
    }

    # Add a dropdown to select the SQL query
    query_option = st.selectbox("Select an SQL query:", list(queries.keys()))

    # Get the selected query and run it when the button is clicked
    if st.button("Run Query", key="run_query_1"):
        query = queries[query_option]
        result = run_query(query)
        print(result)
        # Create a table with black text color
        table_html = "<table style='color:black'><thead><tr>"
        for row in result:
            table_html += "<tr>"
            for col in row:
                table_html += f"<td>{col}</td>"
            table_html += "</tr>"
        table_html += "</tbody></table>"
        # Display the table
        st.markdown(table_html, unsafe_allow_html=True)
   
    # Show a table of movies
    st.markdown("<h3 style='color: black; font-weight: bold;'>Top 10 Movies</h1>",
                unsafe_allow_html=True)
    query = "SELECT primary_title, start_year, average_rating FROM basics JOIN ratings ON basics.tconst = ratings.tconst WHERE average_rating >= 7.0 ORDER BY average_rating DESC LIMIT 10;"
    result = run_query(query)
    # Create a table with black text color
    table_html = "<table style='color:black'><thead><tr><th>Title</th><th>Release Year</th><th>Rating</th></tr></thead><tbody>"
    for row in result:
        table_html += f"<tr><td>{row[0]}</td><td>{row[1]}</td><td>{row[2]}</td></tr>"
    table_html += "</tbody></table>"

    # Display the table
    st.markdown(table_html, unsafe_allow_html=True)


if __name__ == "__main__":
    main()
