# Elixir Learning Path - Todo list

During the learning path we will be creating a Todolist API. All functionality will be wrapped up in an API, so if you like the project you can later build an UI on top of it yourself.

## Session 1 - API

Create a new phoenix application ‘todolist’. As this application will not need a database nor a frontend, so we’ll have to add some exclusion flags:

```bash
mix phx.new todolist --no-ecto --no-webpack --no-html --no-gettext
```

We’ll be creating this session just the API as defined by the [postman collection](https://documenter.getpostman.com/view/3078595/TVmLByAG), with mocked responses.

### And now what?

https://hexdocs.pm/phoenix/controllers.html

### Examples

Controller: https://github.com/coverwallet/cw-elixir-poseidon/blob/master/lib/poseidon_web/controllers/health_controller.ex

View: https://github.com/coverwallet/cw-elixir-poseidon/blob/master/lib/poseidon_web/views/health_view.ex

Router: https://github.com/coverwallet/cw-elixir-poseidon/blob/master/lib/poseidon_web/router.ex

Test: https://github.com/coverwallet/cw-elixir-poseidon/blob/master/test/poseidon_web/controllers/health_controller_test.exs
