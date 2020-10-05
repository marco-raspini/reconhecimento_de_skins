#Recursos de Gems utilizados
require 'nokogiri'
require 'net/http'
require 'titleize'


while 1 == 1
    #Inicia o programa
    puts ""
    puts "|========================================|"
    puts "||=-=Reconhecimento de Skins Valorant=-=||"
    puts "|                                        |"
    puts "|   01-[Descobrir o preço da skin]       |"
    puts "|   02-[Visualisar tabela de custo]      |"
    puts "|   00-[Finalizar programa]              |"        
    puts "|                                        |"
    print "- O que gostaria de se fazer: "
    opc = gets.chomp.to_i
    puts ""
    
    if opc == 0
        #Finaliza o programa
        puts "====----------------------------------------------------===="
        puts "=-= Pretendo melhorar, mas muito obrigado por utilizar!! =-="
        puts "====----------------------------------------------------===="
        puts ""
        break

    elsif opc == 2
        #Informa uma tabela de preços 
        puts ""
        puts "|=-=-=-=-=-=-=-=-=-=-==-=-==-=-=-=|"
        puts "||   =-=  Tabela de custo  =-=   ||"
        puts "|     =-= Valorant Points =-=     |"
        puts "| Quantidade VP  |  Preço em R$   |"
        puts "|                |                |"
        puts "|   500          |   14,90        |"
        puts "|   1050         |   29,90        |"
        puts "|   2175         |   59,90        |"
        puts "|   3850         |   104,90       |"
        puts "|   5550         |   149,90       |"
        puts "|   11500        |   299,90       |"
        puts "|                                 |"
        puts "|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=|"
        puts ""
        puts ""
    elsif opc == 1 
        #Recebe o nome da skin e faz o processo de comparação e devolução do custo
        puts "|-------------------------------------------------------------------|"
        puts "||Verifique o arquivo txt para saber alguns exemplos de opções||\n"
        print'||Insira o nome da Skin desejada: '
        skin_name = gets.chomp
        skin_name = skin_name.titleize #Modificando para cada primeira letra da palavra ficar Maiuscula
        preco_skin = 0
        puts ""
        https = Net::HTTP.new('valorant.fandom.com', 443) #Site sobre Valorant
        https.use_ssl = true

        response = https.get("/wiki/Weapon_Skins") #Tag para a aba de skins do jogo

        doc = Nokogiri::HTML(response.body)


        doc.css('table.wikitable tr').each do |tr_backup| #Percorre todas as <table>
            if ! (tr_backup.css('img').length == 0) #Verifica se há uma <img> dentro da <table>
                skin_site = tr_backup.css('img').first['alt']
                if (skin_site.include? (skin_name)) #Verifica se o nome incluido é igual ao nome da skin pego no <alt> da <img>
                    preco_skin = tr_backup.css('td').last.css('span').text.delete(',').to_i #Pega o valor da skin em <text> e transforma em Int
                    puts "O preço da skin é #{preco_skin} VP \n"
                    #Começa a comparação dos preços e declaração de custo
                    if(preco_skin == 875)
                        puts "---------------------------------------"
                        puts "O valor em dinheiro deve ser de R$29,90"
                        puts "É o equivalente a 1050 Valorant Points;"
                        puts "--------------------------------------"
                    elsif(preco_skin == 1275)
                        puts "---------------------------------------"
                        puts "O valor em dinheiro deve ser de R$44,70"
                        puts "(3 vezes de R$14,90 cada um recebe-se )"
                        puts "É o equivalente a 1500 Valorant Points;"
                        puts "---------------------------------------"
                    elsif(preco_skin >=1750 and preco_skin <=2175)
                        puts "---------------------------------------"
                        puts "O valor em dinheiro deve ser de R$59,90"
                        puts "É o equivalente a 2175 Valorant Points;"
                        puts "---------------------------------------"
                    elsif(preco_skin >=2475 and preco_skin <=2550)
                        puts "---------------------------------------"
                        puts "O valor em dinheiro deve ser de R$89,70" 
                        puts "(3 vezes de R$29,90)"
                        puts "É o equivalente a 3150 Valorant Points;"
                        puts "---------------------------------------"
                    elsif(preco_skin == 3550)
                        puts "----------------------------------------"
                        puts "O valor em dinheiro deve ser de R$103,70"
                        puts "(1 vez de R$59,90, 1 vez de R$29,90 e 1 vez de R$14,90)"
                        puts "É o equivalente a 3725 Valorant Points;"
                        puts "----------------------------------------"
                    elsif(preco_skin == 4350)
                        puts "----------------------------------------"
                        puts "O valor em dinheiro deve ser de R$119,80" 
                        puts "(2 vezes de R$59,90) OU (1 vez de 104,90 e 1 vez de 14,90)"
                        puts "É o equivalente a 4350 Valorant Points;"
                        puts "----------------------------------------"
                    elsif(preco_skin == 4375)
                        puts "----------------------------------------"
                        puts "O valor em dinheiro deve ser de R$134,80"
                        puts "(1 vez de R$104,90 e 1 vez de R$29,90)"
                        puts "É o equivalente a 4900 Valorant Points;"
                        puts "----------------------------------------"
                    elsif(preco_skin >=4940 and preco_skin <=5325)
                        puts "----------------------------------------"
                        puts "O valor em dinheiro deve ser de R$149,90"
                        puts "É o equivalente a 5550 Valorant Points;"
                        puts "----------------------------------------"
                    elsif(preco_skin == 6375)
                        puts "----------------------------------------"
                        puts "O valor em dinheiro deve ser de R$179,80"
                        puts "(1 vez de 149,90 e 1 vez de 29,90)"
                        puts "É o equivalente a 6600 Valorant Points;"
                        puts "----------------------------------------"
                    elsif(preco_skin == 7100)
                        puts "----------------------------------------"
                        puts "O valor em dinheiro deve ser de R$209,80"
                        puts "(1 vez de 149,90 e 1 vez de 59,90)"
                        puts "É o equivalente a 7725 Valorant Points;"
                        puts "----------------------------------------"
                    elsif(preco_skin == 8700)
                        puts "----------------------------------------"
                        puts "O valor em dinheiro deve ser de R$194,70"
                        puts "(1 vez de R$104,90, 1 vez de R$59,90 e 1 vez de 29,90 )"
                        puts "É o equivalente a 8775 Valorant Points;"
                        puts "----------------------------------------"
                    elsif(preco_skin == 9900)
                        puts "----------------------------------------"
                        puts "O valor em dinheiro deve ser de R$299,90"
                        puts "É o equivalente a 11500 Valorant Points;"
                        puts "----------------------------------------"
                    else
                        puts "====------------------------------------===="
                        puts "=-= Valor não encontrado tente novamente =-="
                        puts "====------------------------------------===="
                    end
                    puts ""
                end
            end
        end
    else
        #Entrada de numero invalido
        puts "====----------------------------------------------===="
        puts "=-= Opção não encontrada por favor tente novamente =-="
        puts "====----------------------------------------------===="
        puts ""
    end

end
