<!-- AUTO-GENERATED-CONTENT:START (STARTER) -->
<p align="center">  
    <img alt="SARC logo" src="https://raw.githubusercontent.com/dev-willcode/sarc-web/master/src/assets/logo-negativo.png" />
</p>
<section align="center">

[![Maintenance](https://img.shields.io/badge/make%20with-love%20%E2%99%A5-red?style=for-the-badge)]() [![issues](https://img.shields.io/github/issues/dev-willcode/sarc-api?style=for-the-badge)](https://github.com/dev-willcode/sarc-api/issues) [![forks](https://img.shields.io/github/forks/dev-willcode/sarc-api?style=for-the-badge)](https://github.com/dev-willcode/sarc-api/network) [![stars](https://img.shields.io/github/stars/dev-willcode/sarc-api?style=for-the-badge)](https://github.com/dev-willcode/sarc-api/stargazers) 
</section>
<h1 align="center">
  SARC Systems - Backend project
</h1>


_El proyecto utiliza el gestor de base de datos postgreSQL, por lo cual es necesario instalarlo en el sistema operativo local 👉 [Instalación de postgreSQL](https://www.postgresqltutorial.com/install-postgresql/), y también necesita de las librerias GTK3 para los reportes con Weasyprint, mas info here 👉 [Instalación GTK3](https://www.gtk.org/docs/installations/windows)_.

## 🚀 Quick start
1. **Base de datos.**
    Se puede iniciar con una base de datos limpia unicamente creando una base de datos de ejemplo:
    ```sql
    CREATE DATABASE sarcdb;
    ```
    En la ruta  `sarcapi/settings.py` establecer la conexión a base de datos con la configuración correspondiente:
    ```python
    # cambiar las credenciales de acceso para su cliente de postgreSQL, usuario y contraseña
    DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2',
        'NAME': 'sarcdb',
        'USER': 'postgres',
        'PASSWORD': 'admin', 
        'HOST': 'localhost',
        'PORT': ''
        }
    }
    ```
    
    _También hay un archivo de backup con la [base de datos con registros y los activadores requeridos](https://github.com/dev-willcode/sarc-api/tree/master/docs) implementados, para trabajar con registros preestablecidos._
    
    <br />

2. **Dependencias.**
    El proyecto esta preparado bajo un entorno virtual con python, por lo que hace falta inicializarlo e instalar dependencias. En la raiz del proyecto, ejecutar los comandos:
    ```shell
    python -m venv .env
    python install pip
    .\.env\Scripts\activate
    pip install -r .\requirements.txt
    ```
    
    <br />

3.  **Creación de modelos.**    
    Luego de instalar las dependencias y con el entorno virtual activado, se procede a crear las migraciones con django:
    
    _Si restauró la base de datos previamente, este paso puede ser obviado._
    
    ```python
    py ./manage.py makemigrations
    py ./manage.py migrate
    ```
    <br />

5.  **Ejecución del servidor.**

    Ejecute el comando:

    ```shell
    py ./manage.py runserver
    ```

    El sitio por defecto correrá bajo la dirección `http://127.0.0.1:8000/api`.


## 🎓 Technologies

Impresionante todo el trabajo que hace por debajo django con rest framework, casi no hay que hacer nada mas que definir modelos!

- **[Python](https://www.python.org/).** Primera vez con el lenguaje, viniendo de JS, me parece bastante familiar, ya veo porque es tan popular ❤.

- **[Django Rest Framework](https://vuejs.org/).** Impresionante todo el trabajo que hace por debajo django con rest framework, casi no hay que hacer nada mas que definir modelos!

- **[DRF Writable Nested](https://pypi.org/project/drf-writable-nested/0.0.2/).** Para serializar y guardar/editar entidades heredadas dentro una response, la gloria 👌.

- **[Weasyprint](https://weasyprint.readthedocs.io/en/stable/install.html#windows).** Un verdadero dolor de cabeza instalarlo, pero los reportes quedaron 10/10.


## 👍 Acknowledgment


- **[Heroku](https://www.heroku.com/platform).** Gracias por el servicio, nunca habia desplegado una aplicación, y no me senti tan perdido 😂.
