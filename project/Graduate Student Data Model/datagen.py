from faker import Faker
from random import randint
import pandas as pd
from datetime import datetime

fake = Faker()
fnames_list = []
lnames_list = []
id_list = []
address_list = []
email_list = []
country_list = []
dob_list = []
emp_list = []
coop_list = []
phone_list = []
city_list = []
state_list = []
zip_list = []
gender_list = []
oncampus_list = []
home_address_list = []
home_city_list = []
home_state_list = []
home_zip_list = []
prof_address_list = []
prof_city_list = []
prof_state_list = []
prof_zip_list = []
grad_date_list = []

for i in range(500) :
    f_name = fake.first_name()
    l_name = fake.last_name()
    email = f_name.lower()+"."+l_name[0].lower()+"@northeastern.edu"
    id_list.append(randint(1000000, 9999999))
    fnames_list.append(f_name)
    lnames_list.append(l_name)
    address_list.append(fake.street_address())
    city_list.append(fake.city())
    state_list.append(fake.state())
    zip_list.append(fake.postcode())
    email_list.append(email)
    country_list.append(fake.country())
    phone_list.append(fake.phone_number())
    dob_list.append(fake.date_of_birth())
    oncampus_list.append('No')
    home_address_list.append(fake.street_address())
    home_city_list.append(fake.city())
    home_state_list.append(fake.state())
    home_zip_list.append(fake.postcode())
    prof_address_list.append(fake.street_address())
    prof_city_list.append(fake.city())
    prof_state_list.append(fake.state())
    prof_zip_list.append(fake.postcode())
    grad_date_list.append(fake.date_between_dates(date_start=datetime(2022, 1, 1), date_end=datetime(2025, 12, 31)))
    if i%2 == 0 :
        emp_list.append("Employed")
        gender_list.append("M")
    else :
        emp_list.append("Unemployed")
        gender_list.append("F")

    if i%3 == 0 :
        coop_list.append("Yes")
    else :
        coop_list.append("No")

student_df = pd.DataFrame(columns=['NUID','FirstName','LastName','DOB','Email','Gender','OnCampus', 'GraduationDate',
                                   'StreetAddress','City','State','Zipcode','CountryOfOrigin','EmpStatus','CoopStatus',
                                   'Home_Address','Home_City','Home_State','Home_Zipcode',
                                   'Prof_Address','Prof_City','Prof_State','Prof_Zipcode'])
student_df['NUID'] = id_list
student_df['FirstName'] = fnames_list
student_df['LastName'] = lnames_list
student_df['DOB'] = dob_list
student_df['Email'] = email_list
student_df['Gender'] = gender_list
student_df['OnCampus'] = oncampus_list
student_df['StreetAddress'] = address_list
student_df['City'] = city_list
student_df['State'] = state_list
student_df['Zipcode'] = zip_list
student_df['CountryOfOrigin'] = country_list
student_df['EmpStatus'] = emp_list
student_df['GraduationDate'] = grad_date_list
student_df['CoopStatus'] = coop_list
student_df['Home_Address'] = home_address_list
student_df['Home_City'] = home_city_list
student_df['Home_State'] = home_state_list
student_df['Home_Zipcode'] = home_zip_list
student_df['Prof_Address'] = prof_address_list
student_df['Prof_City'] = prof_city_list
student_df['Prof_State'] = prof_state_list
student_df['Prof_Zipcode'] = prof_zip_list


student_df.to_csv('StudentData.csv')

#student_df = pd.read_csv('Student_Data.csv')
co_df = pd.read_csv('Course_Offerings.csv', encoding='ISO-8859-1')
course_list = co_df['ProgramName/Department']
prof_list = co_df['Instructor']
course_num_list = co_df['Course Number']
core_list = co_df['Core']
enrolled_course_list = []
enrolled_course_prof_list = []
enrolled_course_num_list = []
grades_list = []
enrolled_core_list = []
grads_dict = {1:'A',2:'B+',3:'B',4:'B-',5:'C'}

for i in range(len(student_df.index)) :
    n = randint(0, len(co_df.index)-1)
    enrolled_course_list.append(course_list[n])
    enrolled_course_prof_list.append(prof_list[n])
    enrolled_course_num_list.append(course_num_list[n])
    enrolled_core_list.append(core_list[n])
    g = randint(1,5)
    grades_list.append(grads_dict[g])

final_df = pd.DataFrame(columns=['Course','Course Number','Instructor','Grade','Core'])

final_df['Course'] = enrolled_course_list
final_df['Course Number'] = enrolled_course_num_list
final_df['Instructor'] = enrolled_course_prof_list
final_df['Grade'] = grades_list
final_df['Core'] = enrolled_core_list
datagen_df = pd.DataFrame()
datagen_df = pd.concat([student_df, final_df], axis=1)
datagen_df.to_csv('GeneratedData.csv')
