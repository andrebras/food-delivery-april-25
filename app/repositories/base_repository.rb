class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []
    @next_id = 1

    load_csv
  end

  def all
    @elements
  end

  def add(element)
    element.id = @next_id
    @elements << element
    @next_id += 1
    write_csv
  end

  private

  def write_csv
    CSV.open(@csv_file, 'w') do |row|
      row << build_row_header
      @elements.each do |element|
        row << build_row(element)
      end
    end
  end

  def load_csv
    return unless File.exist?(@csv_file)

    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @next_id += 1
      @elements << build_instance(row)
    end
  end
end




