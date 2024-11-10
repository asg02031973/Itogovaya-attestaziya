# Передаем в Dockerfile аргумент PYTHON_VERSION, значение по умолчанию - 3.12
ARG PYTHON_VERSION=3.12
FROM python:${PYTHON_VERSION}-slim
# Устанавливаем рабочую директорию в базовом образе для команд COPY, RUN, ENTRYPOINT и CMD
WORKDIR /app
# Копируем с хоста в образ файл с требуемыми зависимостями
COPY requirements.txt ./
# Устанавливаем зависимости внутри образа
RUN pip install --no-cache-dir -r requirements.txt
# Копируем код приложения в контейнер, одновременно выставляя нужные разрешения
COPY --chmod=744 app.py ./
# Копируем с хоста в образ файл с с данными сотрудников
COPY data.csv ./
# Задаем команду, которая будет запускаться при старте контейнера
ENTRYPOINT [ "python" ]
# Задаем аргументы по умолчанию для команды в ENTRYPOINT
CMD [ "app.py" ]
