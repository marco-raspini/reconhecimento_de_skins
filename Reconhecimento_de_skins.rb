#Recursos de Gems utilizados
require 'nokogiri'
require 'net/http'
require 'titleize'

Skins = [
    "Elderflame Frenzy",
    "Aristocrat Vandal",
    "Reaver Operator",
    "Sakura Classic" ,
    "Convex Bulldog",
    "Nebula Knife", 
    "Oni Phantom"
]

valores = {
875 => "O valor em dinheiro deve ser de R$29,90\nÉ o equivalente a 1050 Valorant Points\n",
1275 => "O valor em dinheiro deve ser de R$44,70\n(3 vezes de R$14,90 cada um recebe-se ) É o equivalente a 1500 Valorant Points\n",
1750 => "O valor em dinheiro deve ser de R$59,90\nÉ o equivalente a 2175 Valorant Points\n",
1775 => "O valor em dinheiro deve ser de R$59,90\nÉ o equivalente a 2175 Valorant Points\n",
2175 => "O valor em dinheiro deve ser de R$59,90\nÉ o equivalente a 2175 Valorant Points\n",
2475 => "O valor em dinheiro deve ser de R$89,70\n(3 vezes de R$29,90) É o equivalente a 3150 Valorant Points\n",
2550 => "O valor em dinheiro deve ser de R$89,70\n(3 vezes de R$29,90) É o equivalente a 3150 Valorant Points\n",
3550 => "O valor em dinheiro deve ser de R$103,70\n(1 vez de R$59,90, 1 vez de R$29,90 e 1 vez de R$14,90) É o equivalente a 3725 Valorant Points\n",
4350 => "O valor em dinheiro deve ser de R$119,80\n(2 vezes de R$59,90) OU (1 vez de 104,90 e 1 vez de 14,90) É o equivalente a 4350 Valorant Points\n",
4375 => "O valor em dinheiro deve ser de R$134,80\n(1 vez de R$104,90 e 1 vez de R$29,90) É o equivalente a 4900 Valorant Points\n",
4950 => "O valor em dinheiro deve ser de R$149,90\nÉ o equivalente a 5550 Valorant Points\n",
5325 => "O valor em dinheiro deve ser de R$149,90\nÉ o equivalente a 5550 Valorant Points\n",
6375 => "O valor em dinheiro deve ser de R$179,80\n(1 vez de 149,90 e 1 vez de 29,90) É o equivalente a 6600 Valorant Points\n",
7100 => "O valor em dinheiro deve ser de R$209,80\n(1 vez de 149,90 e 1 vez de 59,90) É o equivalente a 7725 Valorant Points\n",
8700 => "O valor em dinheiro deve ser de R$194,70\n(1 vez de R$104,90, 1 vez de R$59,90 e 1 vez de 29,90 ) É o equivalente a 8775 Valorant Points\n",
9900 => "O valor em dinheiro deve ser de R$299,90\nÉ o equivalente a 11500 Valorant Points\n"
}

while 1 == 1
    #Inicia o programa
    puts ""
    puts "|{-=-=-=-=-=-=-=]}=-={[=-=-=-=-==-=-=-=-}|"
    puts "Reconhecimento de Skins Valorant".center(42, '|=-=|')
    puts "|                                        |"
    puts "|   01-[Descobrir o preço da skin]       |"
    puts "|   02-[Visualisar tabela de custo]      |"
    puts "|   03-[Visualirar tabela de skins]      |"
    puts "|   00-[Finalizar programa]              |"        
    puts "|                                        |"
    print "- O que gostaria de se fazer: "
    opc = gets.chomp.to_i
    puts ""
    
    if opc == 0
        #Finaliza o programa
        puts "==}--{==".center(60,'==-')
        puts "=-= Pretendo melhorar, mas muito obrigado por utilizar!! =-="
        puts "==}--{==".center(60,'==-')
        break

    elsif opc == 2
        #Informa uma tabela de preços 
        puts ""
        puts "|{-=-=-=-=-=-=}]=-=[{=-=-=-=-=-=-}|"
        puts "||   =-=  Tabela de custo  =-=   ||"
        puts "|   =-=   Valorant Points   =-=   |"
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

    elsif opc == 3
        #Informa uma tabela com as skins que podem ser selecionadas
        puts ""
        puts "|{-=-=-=-=-=-=}]=-=[{=-=-=-=-=-=-}|"
        puts "|    Codigo     |    Nome_Skin    |"
        puts "|                                 |"
        Skins.each {|x| puts "|    #{Skins.index(x)+1} -=-  #{x}"} #Percorre a lista de "Skins" e informa na tela o que contem dentro da lista
        puts "|                                 |"
        puts "|=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=|"
        puts ""

    elsif opc == 1 
        #Recebe o nome da skin e faz o processo de comparação e devolução do custo
        puts "|-------------------------------------------------------------------|"
        print"||Insira o código da skin desejada: "
        skin_cdg = gets.chomp.to_i
        skin_cdg = skin_cdg - 1
        skin_name = Skins[skin_cdg].titleize #Modificando para cada primeira letra da palavra ficar Maiuscula
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
                    puts "Skin: #{skin_name}"
                    puts "O preço: #{preco_skin} VP"
                    #Começa a comparação dos preços e declaração de custo
                    if(valores.key?(preco_skin))
                        puts valores[preco_skin]
                    else
                        puts "==}--{==".center(44,'=-=')
                        puts "=-= Valor não encontrado tente novamente =-="
                        puts "==}--{==".center(44,'=-=')
                    end
                    puts ""
                end
            end
        end
    else
        #Entrada de numero invalido
        puts "==}--{==".center(54,'=-=-')
        puts "=-= Opção não encontrada por favor tente novamente =-="
        puts "==}--{==".center(54,'=-=-')
    end

end
