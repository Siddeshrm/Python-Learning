import streamlit as st

st.title("Streamlit application")
st.write("hello this is my first application")

"""
For streamlit files
streamlit run <file_name>
streamlit run Ex-streamlit.py
"""


st.text_input("fixed_acidity","Type Here")
st.button("predict")