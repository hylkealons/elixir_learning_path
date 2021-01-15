# 1. Simple example

  # production
  config :todolist, http_client: HttpPoison # https://github.com/edgurgel/httpoison

  # test.ex
  config :todolist, http_client: FakeHttpClient

  # code
  defmodule .. do
    @http_client Application.get_env(:poseidon, :http_client)

    def my_function(opts \\ []) do
      @http_client.get()
    end
  end


# 2. Contract based testing & dependency injection

  defmodule MyModule do
    def function(opts \\ []) do
      http_client = HttpPoison || opts[:http_client]
      http_client.get()
    end
  end


  defmodule Test do
    # ...
    defmodule HttpClient404 do
      def get do
        {:ok, %HTTPoison.Response{status_code: 404}}
      end
    end

    defmodule HttpClient501 do
      def get do
        {:ok, %HTTPoison.Response{status_code: 501}}
      end
    end

    test "when the client returns a 404" do
      MyModule.function(http_client: HttpClient404)
    end

    test "when the client returns a 501" do
      MyModule.function(http_client: HttpClient501)
    end
  end


# 3. Production example & Combined https://github.com/coverwallet/cw-elixir-poseidon/blob/master/config/test.exs#L27
  config :poseidon,
    pubsub_client: PoseidonServices.Pubsub.GCP.ClientMock


  # Code: https://github.com/coverwallet/cw-elixir-poseidon/blob/master/lib/poseidon_services/pubsub/gcp/client.ex
  defmodule ... do
    alias PoseidonServices.Pubsub.GCP.Publisher
    alias Poseidon.Events.Event

    @behaviour Application.get_env(:poseidon, :pubsub_client)

    @default_publisher_service Publisher

    @spec publish(Event.t()) :: tuple()
    def publish(event, opts \\ []) do
      publisher_service = Keyword.get(opts, :publisher_service, @default_publisher_service)
      publisher_service.publish(event)
    end
  end
