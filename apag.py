from faker import Faker

fake = Faker ('pt-BR')

cpf = fake.cpf()
print (cpf)