function fn() {
  var config = {
    baseUrl: 'https://bnjqjtsxgoenzzjzzwhe.supabase.co',
    supabaseKey: 'sb_publishable_f98rPx2O8YbjxhH5Sm3u8g_MIFqACVH'
  };

  karate.configure('headers', { 
    'apikey': config.supabaseKey,
    'Authorization': 'Bearer ' + config.supabaseKey 
  });

  return config;
}