#coding: UTF-8
file = File.open("cadastrados.txt")
agenda = file.read
puts agenda
agenda = {}

while true
  puts ''
  puts agenda
  puts '1- Adicionar'
  puts '2- Atualizar'
  puts '3- Exibir'
  puts '4- Excluir'
  puts '5- Para sair'

  print 'Escolha uma opção: '
  escolha = gets.chomp
  puts ''

  case escolha
  when '1'
    print "Insira o nome do contato: "
    nome = gets.chomp
    if agenda[nome.to_sym].nil?
      print 'Insira o telefone: '
      telefone =  gets.chomp
      agenda[nome.to_sym] = telefone
    else
      puts 'Este nome ja existe!'
    end
  when '2'
    puts 'Que nome você deseja atualizar?'
    nome = gets.chomp
    if agenda[nome.to_sym].nil?
      puts 'Este nome não existe!'
    else 
      print 'Insira o telefone: '
      telefone =  gets.chomp
      agenda[nome.to_sym] = telefone
    end
  when '3'
    agenda.each do |nome, telefone|
      puts "O nome é igual  #{nome} e o telefone #{telefone}"
    end
  when '4'
    puts 'Qual você gostaria de excluir?'
    nome = gets.chomp
    if agenda[nome.to_sym].nil?
      puts "Este nome não existe!"
    else
      agenda.delete(nome.to_sym)
      puts "Nome #{nome} foi deletado!!!"
    end
  when '5' 
    file = File.open("cadastrados.txt", "r+"){|file| file.puts "\n #{agenda}"}
    break
  else 
    puts "Desculpa opção invalida!"
  end
end

