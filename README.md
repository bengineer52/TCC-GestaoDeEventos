# README

## Event Manager application
Dependencies:
```
Ruby 3.0.5
Rails 7.1.4
PostgreSQL 14.12
```
Running the app:
```
rake db:create db:migrate # creates the db and populates tables
rake db:seed # deletes application data and creates sample records
```

Routes:

```
                  Prefix Verb   URI Pattern                                                                                       Controller#Action
                    root GET    /                                                                                                 events#index
           subscriptions POST   /subscriptions(.:format)                                                                          subscriptions#create
            subscription DELETE /subscriptions/:id(.:format)                                                                      subscriptions#destroy
                  events GET    /events(.:format)                                                                                 events#index
                         POST   /events(.:format)                                                                                 events#create
               new_event GET    /events/new(.:format)                                                                             events#new
              edit_event GET    /events/:id/edit(.:format)                                                                        events#edit
                   event GET    /events/:id(.:format)                                                                             events#show
                         PATCH  /events/:id(.:format)                                                                             events#update
                         PUT    /events/:id(.:format)                                                                             events#update
                         DELETE /events/:id(.:format)                                                                             events#destroy
        new_user_session GET    /users/sign_in(.:format)                                                                          devise/sessions#new
            user_session POST   /users/sign_in(.:format)                                                                          devise/sessions#create
    destroy_user_session DELETE /users/sign_out(.:format)                                                                         devise/sessions#destroy
   new_user_registration GET    /users/sign_up(.:format)                                                                          devise/registrations#new
       user_registration PATCH  /users(.:format)                                                                                  devise/registrations#update
                         PUT    /users(.:format)                                                                                  devise/registrations#update
                         DELETE /users(.:format)                                                                                  devise/registrations#destroy
                         POST   /users(.:format)                                                                                  devise/registrations#create
      rails_health_check GET
```