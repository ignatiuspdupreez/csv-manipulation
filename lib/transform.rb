class Transform
  def self.for_file(file)
    new(file).process
  end

  def initialize(file)
    @data = File.read(file)
    @sum = {}
    @count = {}
  end

  def process
    data_rows.each do |row|
      transformed_row = transform_to_array_from(row)
      transformed_row.each do |column|
        next unless column.include?("'")
        assign_default_values_for(column)
        sum_and_increment_values_for(transformed_row,column)
      end
    end
    generate_output_file
  end

  private

  def data_rows
    @data.split("\r\n")[1..-1]
  end

  def transform_to_array_from(row)
    row.split(",")
  end

  def assign_default_values_for(column)
    @sum[column] = 0 if @sum[column].nil?
    @count[column] = 0 if @count[column].nil?
  end

  def sum_and_increment_values_for(row, column)
    # byebug
    @sum[column] += row[-1].to_f
    @count[column] += 1
  end

  def generate_output_file
    File.open("Output.csv", "w") do |f|
      f.write("type,sum,count\r\n")
      @sum.map{|k, v| f.write("#{k},#{v},#{@count[k]}\r\n")}
    end
  end
end
