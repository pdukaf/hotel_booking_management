module RequestHelpers
  def parsed_response
    return nil if response.body == ''

    @parsed_response ||= JSON.parse(response.body).deep_symbolize_keys
  end
end
