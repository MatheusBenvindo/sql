import mysql.connector
from faker import Faker
import random

fake = Faker('pt_BR')  # Use o local pt_BR para gerar dados brasileiros

# Conexão ao banco de dados MariaDB
mydb = mysql.connector.connect(
    host="localhost",
    user="root",  # Usuário root do MariaDB
    password="",  # Senha vazia
    database="teste"
)

mycursor = mydb.cursor()

def sex():
    sexg = random.choice(['M', 'F'])
    if sexg == 'M':
        name = fake.name_male()
    else:
        name = fake.name_female()
    return name, sexg

# Gerar 50 registros falsos
for _ in range(50):
    nome, sexg = sex()
    sobrenome = fake.last_name()
    cpf = fake.cpf()
    matricula = fake.random_number(digits=9, fix_len=True)
    sql = f"INSERT INTO alunos (nome, sobrenome, cpf, sexo, matricula) VALUES ('{nome}', '{sobrenome}', '{cpf}', '{sexg}', '{matricula}');"
    mycursor.execute(sql)

mydb.commit()

print("Dados inseridos diretamente no banco de dados.")

# Fechar a conexão
mycursor.close()
mydb.close()