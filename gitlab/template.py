import json
import pandas as pd

xls=pd.ExcelFile("./gitlab-user.xlsx")
data_list = []
for project in xls.sheet_names:
    if not project[0].isdigit():
        df=pd.read_excel(xls,project)
        user_list=[]
        for _, row in df.iterrows():
            if pd.notna(row['username']) and row['permission'] != '':
                user_list.append({row['username']:row['permission']})
        data_list.append({project:user_list})


with open('gitlab.json', 'w') as fp:
    json.dump(data_list, fp)