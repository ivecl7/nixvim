{
  plugins.minuet = {
    enable = true;
    settings = {
      provider = "openai_compatible";
      provider_options = {
        openai_compatible = {
          api_key = "DEEPSEEK_API_KEY";
          endpoint = "https://api.deepseek.com/v1";
          model = "deepseek-chat";
          name = "deepseek";
          optional = {
            max_tokens = 256;
            top_p = 0.9;
          };
        };
      };
    };
  };
}
