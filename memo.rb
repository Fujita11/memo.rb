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
  data = gets.chomp.split(',')
  CSV.open(filename, 'a') do |csv|
    csv << data
  end
end

def main  
  loop do
    puts "1. 新規ファイルを作成"
    puts "2. 既存のファイルを編集"
    choice = gets.chomp

    if choice == '1'
      create_new_file
      break
    elsif choice == '2'
      edit_existing_file
      break
    else
      puts "1か2を入力してください"
    end
  end
end

main
