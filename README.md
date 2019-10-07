# ÜberauthHatena
> Hatena strategy for Überauth.

## Installation
Add `:ueberauth_hatena` to list of your dependencies in `mix.exs`.

```elixir
def deps do
  [{:ueberauth_hatena, "~> 0.1"},
   {:oauth, github: "tim/erlang-oauth"}]
end
```

## Usage
1. Create your OAuth application at [Hatena Developer Center](https://www.hatena.ne.jp/oauth/develop).
2. Add Hatena to your Ueberauth configuration.
    ```elixir
    config :ueberauth, Ueberauth,
      providers: [
        hatena: {Ueberauth.Strategy.Hatena, []}
      ]
    ```
3. Add consumer key and secret from your OAuth application. And set scope the application.
    ```elixir
    config :ueberauth, Ueberauth.Strategy.Hatena.OAuth,
      consumer_key: System.get_env("HATENA_CONSUMER_KEY"),
      consumer_secret: System.get_env("HATENA_CONSUMER_SECRET"),
      scope: "read_public,write_public"
    ```
4. Include the Ueberauth plug in your controller. And please implement request method and callback method.
    ```elixir
    defmodule MyApp.AuthController do
      use MyApp.Web, :controller
      plug Ueberauth

      def request(conn, _params) do
        ...
      end

      def callback(conn, _params) do
        ...
      end
    end
    ```
5. Create reqeust and callback endpoint your router.
    ```elixir
    scope "/auth", MyApp do
      pipe_through :browser

      get "/:provider", AuthController, :request
      get "/:provider/callback", AuthController, :callback
    end
    ```

For an example implementation see the [Überauth Example application](https://github.com/ueberauth/ueberauth_example).

## License
The software is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

