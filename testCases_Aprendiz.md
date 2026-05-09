## ✅ Casos de Prueba

### 🗒️ User Story #2: Autenticación de usuario Aprendiz

Como aprendiz,
quiero autenticarme mediante un servicio,
para obtener acceso a los recursos permitidos por la plataforma.

#### **Scenario: CP01 - Login Exitoso**
*   **Given:** la API de autenticación está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de login con un email y password válidos
*   **Then:** el código de respuesta debe ser 200 OK
*   **And:** el cuerpo del JSON debe contener el token de acceso.


#### **Scenario: CP02 - Login con usuario no registrado**
*   **Given:** la API de autenticación está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de login con un email no registrado
*   **Then:** el código de respuesta debe ser 400
*   **And:** el mensaje de error en la respuesta debe ser "Invalid login credentials"


#### **Scenario: CP03 - Login con email de formato inválido**
*   **Given:** la API de autenticación está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de login con un email con formato inválido
*   **Then:** el código de respuesta debe ser 400
*   **And:** el mensaje de error en la respuesta debe ser "Invalid login credentials"


#### **Scenario: CP04 - Login con email vacío**
*   **Given:** la API de autenticación está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de login con el campo email vacío
*   **Then:** el código de respuesta debe ser 400
*   **And:** el mensaje de error en la respuesta debe ser "missing email or phone"


#### **Scenario: CP05 - Login con contraseña inválida**
*   **Given:** la API de autenticación está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de login con un email registrado y una contraseña incorrecta
*   **Then:** el código de respuesta debe ser 400
*   **And:** el mensaje de error en la respuesta debe ser "Invalid login credentials"


#### **Scenario: CP06 - Login con contraseña vacía**
*   **Given:** la API de autenticación está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de login con un email registrado y una contraseña vacía
*   **Then:** el código de respuesta debe ser 400
*   **And:** el mensaje de error en la respuesta debe ser "Invalid Login Credentials"


#### **Scenario: CP07 - Login con campo email ausente**
*   **Given:** la API de autenticación está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de login con el campo email ausente
*   **Then:** el código de respuesta debe ser 400
*   **And:** el mensaje de error en la respuesta debe ser "missing email or phone"


#### **Scenario: CP08 - Login con campo contraseña ausente**
*   **Given:** la API de autenticación está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de login con un email registrado y el campo contraseña ausente
*   **Then:** el código de respuesta debe ser 400
*   **And:** el mensaje de error en la respuesta debe ser "Invalid Login Credentials"


### 🗒️ User Story #3: Registro de usuario Aprendiz

Como usuario nuevo,
quiero registrarme mediante un servicio,
para crear una cuenta dentro de la plataforma.


#### **Scenario: CP01 - Registro Exitoso**
*   **Given:** la API de registro está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de Registro con datos válidos
*   **Then:** el código de respuesta debe ser 200 OK
*   **And:** el cuerpo del JSON debe contener el token de acceso.
*   **And:** el valor de email coincide con el enviado en el request
*   **And:** los campos id y role se encuentran dentro del objeto user con el formato correcto
*   **And:** el campo expires_in es un valor entero


#### **Scenario: CP02 - Registro con email duplicado**
*   **Given:** la API de registro está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de Registro con un email duplicado o existente
*   **Then:** el código de respuesta debe ser 402
*   **And:** el mensaje de error en la respuesta debe ser "user_already_exists"


#### **Scenario: CP03 - Registro sin contraseña**
*   **Given:** la API de registro está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de Registro sin enviar contraseña
*   **Then:** el código de respuesta debe ser 400
*   **And:** el mensaje de error en la respuesta contiene un texto descriptivo sobre el requerimiento de contraseña


#### **Scenario: CP04 - Registro sin email**
*   **Given:** la API de registro está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de Registro sin enviar email
*   **Then:** el código de respuesta debe ser 422
*   **And:** el mensaje de error en la respuesta contiene un texto descriptivo sobre el requerimiento de email


#### **Scenario: CP05 - Registro con email inválido**
*   **Given:** la API de registro está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de Registro con un email inválido
*   **Then:** el código de respuesta debe ser 400
*   **And:** el código de error debe ser "validation_failed"


#### **Scenario: CP06 - Fortaleza de Contraseña (Límite Inferior)**
*   **Given:** la API de registro está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de Registro con una contraseña inválida / débil
*   **Then:** el código de respuesta debe ser 422
*   **And:** la respuesta contiene el objeto anidado weak_password
*   **And:** la respuesta contiene el "length" como motivo


#### **Scenario: CP07 - Registro sin campos optativos (Nombre, País, WhatsApp)**
*   **Given:** la API de registro está operativa en la base_Url
*   **When:** se envía una petición POST al endpoint de Registro sin nombre, país ni whatsapp
*   **Then:** el código de respuesta debe ser 200 OK
*   **And:** los campos optativos permanecen vacíos