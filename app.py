import pandas as pd

# Загружаем данные из файла data.csv
df = pd.read_csv('data.csv')
# Вычисляем и выводим среднюю зарплату всех сотрудников
mean_salary = sum(df['salary']) / len(df['salary'])
print(f'Средняя зарплата сотрудников: {mean_salary}')
# Отбираем и выводим сотрудников, которым больше 30 лет
filtered_df = df[df['age'] > 30]
print("Сотрудники старше 30 лет:\n", filtered_df)
