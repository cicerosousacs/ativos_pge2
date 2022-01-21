namespace :dev do

DEFAULT_PASSWORD = '@tivos2022'
DEFAULT_FILE_PATH = File.join(Rails.root, 'lib', 'tmp')

  desc "Configura o ambiente de desenvolvimento"
  task setup: :environment do
    if Rails.env.development?
    show_spinner("Apagando BD...") { %x(rails db:drop:_unsafe) }
    show_spinner("Criando BD...") { %x(rails db:create) }
    show_spinner("Migrando BD...") { %x(rails db:migrate) }
    show_spinner("Admin padrão...") { %x(rails dev:add_default_admin) }
    show_spinner("Tipos...") { %x(rails dev:add_types) }
  else
    puts "Você não esta em ambiente de desenvolvimento!"
  end
end
  
  desc "Adiciona o administrador padrão"
  task add_default_admin: :environment do
    Admin.create!(
      email: 'admin@admin.com',
      password: DEFAULT_PASSWORD,
      password_confirmation: DEFAULT_PASSWORD
    )
  end
  
  desc "Adiciona o pagamento padrão"
  task add_types: :environment do
    file_name = 'types.txt'
    file_path = File.join(DEFAULT_FILE_PATH, file_name)

    File.open(file_path, 'r').each do |line|
      Type.create!(description: line.strip)
    end
  end
  








  private
   
  def show_spinner(msg_start, msg_end = "Sucesso!")
    spinner = TTY::Spinner.new("[:spinner] #{msg_start}")
    spinner.auto_spin
    yield
    spinner.success("(#{msg_end})") 
  end

end

