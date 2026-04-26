## ✅ Casos de Prueba

### 🗒️ User Story Autenticación de usuario Aprendiz

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
