require 'csv'

def create_new_file
  puts "新規ファイル名を入力してください:"
  filename = gets.chomp
  CSV.open(filename, 'w') do |csv|
  end
end

def edit_existing_file
  puts "編集するファイル名を入力してください:"
  filename = gets.chomp 
  puts "追加するデータを入力してください (データ1,データ2,データ3):"
  data = ""
  loop do
    input = gets.chomp 
    data << input + "\n"  
    break if input.empty?  
  end
  CSV.open(filename, 'a') do |csv|
    csv << data.strip.split(',')  
  end
  puts "データをファイルに追加しました。"  
end

def main  
  loop do
    puts "1. 新規ファイルを作成"
    puts "2. 既存のファイルを編集"
    choice = gets.chomp

    if choice == '1'
      create_new_file
    elsif choice == '2'
      edit_existing_file
    else
      puts "1か2を入力してください"
      next
    end
  end
end

main
