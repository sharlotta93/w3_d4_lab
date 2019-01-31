class Casting

  attr_reader :id
  attr_accessor :star_id, :movie_id, :fee

  def initialize(casting_data)
    @id = casting_data['id'] if casting_data['id']
    @star_id = casting_data[star_id].to_i
    @movie_id = casting_data['movie_id'].to_i
    @fee = casting_data['fee'].to_i

  end

end
