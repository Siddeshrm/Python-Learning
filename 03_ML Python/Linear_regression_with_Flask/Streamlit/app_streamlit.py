
import numpy as np
import pickle
import pandas as pd
import streamlit as st

from PIL import Image


#model.pkl is used to get the predictions on new data
# in this page np pd pickle we did not used it is masked
# yellow error



pickle_in = open("linear_wine_model.pkl","rb")
classifier=pickle.load(pickle_in)



def welcome():
    return "Welcome All"


def predict_note_authentication(fixed_acidity, volatile_acidity, citric_acid, residual_sugar,
    chlorides, free_sulfur_dioxide, total_sulfur_dioxide, density,
    pH, sulphates, alcohol):

    prediction=classifier.predict([[fixed_acidity, volatile_acidity, citric_acid, residual_sugar,
    chlorides, free_sulfur_dioxide, total_sulfur_dioxide, density,
    pH, sulphates, alcohol]])
    
    print(prediction)
    return prediction

def main():
    st.title("Wine quality")
    html_temp = """
    <div style="background-color:tomato;padding:10px">
    <h2 style="color:white;text-align:center;">Streamlit Wine quality ML App </h2>
    </div>
    """

    st.markdown(html_temp, unsafe_allow_html=True)

    fixed_acidity = st.text_input("fixed_acidity","Type Here")
    volatile_acidity = st.text_input("volatile_acidity","Type Here")
    citric_acid = st.text_input("citric_acid","Type Here")
    residual_sugar = st.text_input("residual_sugar","Type Here")
    chlorides = st.text_input("chlorides","Type Here")
    free_sulfur_dioxide = st.text_input("free_sulfur_dioxide","Type Here")
    total_sulfur_dioxide = st.text_input("total_sulfur_dioxide","Type Here")
    density = st.text_input("density","Type Here")
    pH = st.text_input("pH","Type Here")
    sulphates = st.text_input("sulphates","Type Here")
    alcohol = st.text_input("alcohol","Type Here")

    result=""

    if st.button("Predict"):
        result=predict_note_authentication(eval(fixed_acidity), eval(volatile_acidity), eval(citric_acid),
                                           eval(residual_sugar), eval(chlorides), eval(free_sulfur_dioxide),
                                           eval(total_sulfur_dioxide), eval(density),
                                           eval(pH), eval(sulphates), eval(alcohol))

        st.success('The output is {}'.format(result))

    if st.button("About"):
        st.text("Lets Learn")
        st.text("This is about wine quality red data")

if __name__=='__main__':
    main()