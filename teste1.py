import mysql.connector
from faker import Faker
import random
from unidecode import unidecode  # Para remover acentos

fake = Faker('pt_BR')

# Conexão ao MySQL para criar a base de dados e as tabelas
mydb = mysql.connector.connect(
    host="localhost",
    user="root",  
    password=""  
)

mycursor = mydb.cursor()

# Criar banco de dados livraria
mycursor.execute("CREATE DATABASE IF NOT EXISTS livraria_109")
mycursor.execute("USE livraria_109")

mycursor.execute("""
CREATE TABLE IF NOT EXISTS editoras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    uf VARCHAR(2)
)
""")

mycursor.execute("""
CREATE TABLE IF NOT EXISTS autores (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    sexo CHAR(1),
    cpf VARCHAR(11)
)
""")

mycursor.execute("""
CREATE TABLE IF NOT EXISTS livros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50),
    ano_publicacao DATE,
    num_paginas INT,
    autor_id INT,
    editora_id INT,
    FOREIGN KEY (autor_id) REFERENCES autores(id),
    FOREIGN KEY (editora_id) REFERENCES editoras(id)
)
""")

mydb.commit()

print("Banco de dados e tabelas criados com sucesso.")

# Fechar a conexão
mycursor.close()
mydb.close()
