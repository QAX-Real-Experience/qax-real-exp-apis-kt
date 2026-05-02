function fn() {
  var env = karate.env || 'dev';
  
  // Leer el archivo JSON
  var auth = karate.read('classpath:karate-auth.json');

  var config = {
    baseUrl: 'https://bnjqjtsxgoenzzjzzwhe.supabase.co',
    supabaseKey: auth.supabaseKey
  };

  karate.configure('headers', { 
    'apikey': config.supabaseKey,
    'Authorization': 'Bearer ' + config.supabaseKey,
    'Content-Type': 'application/json'
  });

  return config;
}