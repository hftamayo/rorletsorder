#class for handling HTTP requests

if Rails.env === 'production' 
    Rails.application.config.session_store :cookie_store, key: '_rorletsorder', domain: 'rorletsorder'
else
    Rails.application.config.session_store :cookie_store, key: '_rorletsorder'