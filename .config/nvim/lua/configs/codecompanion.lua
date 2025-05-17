local options = {
  adapters = {
    localllama = function()
      return require("codecompanion.adapters").extend("openai_compatible", {
        formatted_name = "Qwen2.Coder-7B-Instruct",
        env = {
          url = "http://127.0.0.1:5000", -- optional: default value is ollama url http://127.0.0.1:11434
          -- api_key = "OpenAI_API_KEY", -- optional: if your endpoint is authenticated
          chat_url = "/v1/chat/completions", -- optional: default value, override if different
          models_endpoint = "/v1/models", -- optional: attaches to the end of the URL to form the endpoint to retrieve models
        },
        schema = {
          model = {
            default = "Qwen2.5-Coder-7B-Instruct-exl2",  -- define llm model to be used
          },
          temperature = {
            order = 1,
            mapping = "parameters",
            type = "number",
            optional = true,
            default = 0.7,
            desc = "What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or top_p but not both.",
            validate = function(n)
              return n >= 0 and n <= 2, "Must be between 0 and 2"
            end,
          },
          top_k = {
            order = 2,
            mapping = "parameters",
            type = "number",
            optional = true,
            default = 20,
            desc = "Only sample from the top K options for each subsequent token. Use top_k to remove long tail low probability responses",
            validate = function(n)
              return n >= 0, "Must be greater than 0"
            end,
          },
          top_p = {
            order = 2,
            mapping = "parameters",
            type = "number",
            optional = true,
            default = 0.8,
            desc = "Computes the cumulative distribution over all the options for each subsequent token in decreasing probability order and cuts it off once it reaches a particular probability specified by top_p",
            validate = function(n)
              return n >= 0 and n <= 1, "Must be between 0 and 1"
            end,
          },
          max_completion_tokens = {
            order = 4,
            mapping = "parameters",
            type = "integer",
            optional = true,
            default = nil,
            desc = "An upper bound for the number of tokens that can be generated for a completion.",
            validate = function(n)
              return n > 0, "Must be greater than 0"
            end,
          },
          stop = {
            order = 5,
            mapping = "parameters",
            type = "string",
            optional = true,
            default = nil,
            desc = "Sets the stop sequences to use. When this pattern is encountered the LLM will stop generating text and return. Multiple stop patterns may be set by specifying multiple separate stop parameters in a modelfile.",
            validate = function(s)
              return s:len() > 0, "Cannot be an empty string"
            end,
          },
          logit_bias = {
            order = 6,
            mapping = "parameters",
            type = "map",
            optional = true,
            default = nil,
            desc = "Modify the likelihood of specified tokens appearing in the completion. Maps tokens (specified by their token ID) to an associated bias value from -100 to 100. Use https://platform.openai.com/tokenizer to find token IDs.",
            subtype_key = {
              type = "integer",
            },
            subtype = {
              type = "integer",
              validate = function(n)
                return n >= -100 and n <= 100, "Must be between -100 and 100"
              end,
            },
          },
        },
      })
    end,
  },

  strategies = {
    chat = {
      adapter = "localllama",
    },
    inline = {
      adapter = "localllama",
    },
  },
}

return options
