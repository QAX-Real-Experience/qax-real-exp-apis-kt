function fn() {
  var env = karate.env || 'dev';
  
  // Leer el archivo JSON
  var auth = karate.read('classpath:karate-auth.json');

  var config = {
    baseUrl: 'https://bnjqjtsxgoenzzjzzwhe.supabase.co',
    supabaseKey: auth.supabaseKey,
    // Definimos el regex de forma global
    uuidRegex: '^[0-9a-fA-F]{8}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{4}-[0-9a-fA-F]{12}$'
  };

  karate.configure('headers', { 
    'apikey': config.supabaseKey,
    'Authorization': 'Bearer ' + config.supabaseKey,
    'Content-Type': 'application/json'
  });

  return config;
}