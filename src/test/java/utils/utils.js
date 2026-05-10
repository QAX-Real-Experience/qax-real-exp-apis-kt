function fn() {
    var names = ["Juan", "Jose", "Maria", "Ana", "Luis", "Carlos", "Sofia", "Miguel", "Laura", "Diego"];
    var lastNames = ["Perez", "Gomez", "Rodriguez", "Lopez", "Garcia", "Martinez", "Sanchez", "Diaz", "Fernandez", "Gonzalez"];

    return {
        generarEmail: function() {
            var timestamp = new Date().getTime();
            var email = 'usuario' + timestamp + '@qaxpert.com';
            return email;
            },

        generarPassword: function(longitud = 10) {
            var caracteres = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789';
            var password = '';
            for (var i = 0; i < longitud; i++) {
                var indice = Math.floor(Math.random() * caracteres.length);
                password += caracteres.charAt(indice);
            }
            return password;
            }, 
        
        generarFullName: function() {
            var indiceAleatorioName = Math.floor(Math.random() * names.length);
            var indiceAleatorioLastName = Math.floor(Math.random() * lastNames.length);
            var name=  names[indiceAleatorioName] + " " + lastNames[indiceAleatorioLastName];
            return name;
            },
        
        generarCountry: function() {
            var countries = ["Estados Unidos", "México", "España", "Colombia", "Argentina"];
            var indiceAleatorio = Math.floor(Math.random() * countries.length);
            return countries[indiceAleatorio];
            },

        generarWp: function() {
            var prefijo = "+549"; 
            var numero = "";
            for (var i = 0; i < 10; i++) {
                var digitoAleatorio = Math.floor(Math.random() * 10);
                numero += digitoAleatorio;
            }
            return prefijo + numero;
            }   
    };

}
