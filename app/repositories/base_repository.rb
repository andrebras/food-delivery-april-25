require 'csv'

class BaseRepository
  def initialize(csv_file)
    @csv_file = csv_file
    @elements = []

    load_csv
    read_next_id
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

  def read_next_id
    # Read next id from file. E.g. 'meals.csv.id'
    @next_id = File.open("#{@csv_file}.id").read.to_i
  end

  def write_csv
    CSV.open(@csv_file, 'w') do |row|
      # Write first row to csv file (headers)
      row << build_row_header

      # 'Convert' each element to an array of values and write to file
      @elements.each do |element|
        row << build_row(element)
      end
    end

    # Save next id to file
    File.open("#{@csv_file}.id", "w") { |f| f.write(@next_id) }
  end

  def load_csv
    return unless File.exist?(@csv_file)

    csv_options = { headers: :first_row, header_converters: :symbol }
    CSV.foreach(@csv_file, csv_options) do |row|
      @elements << build_instance(row)
    end
  end
end




