//
//  DataBase.swift
//  Chefee
//
//  Created by Vitor Cheung on 11/11/22.
//

import Foundation
import SwiftUI
class DataBase: ObservableObject {
    static var shared = DataBase()
    var comidasPaises: [String] = []
    @Published var receitas: [Receita]
    @Published var ingredientes: [Ingrediente]
    @Published var recitasFavoritadas: [Receita]
    
    private init() {
        
        self.ingredientes = [
            Ingrediente(nome: "lata de molho de tomate tradicional", estaNaGeladeira: false),
            Ingrediente(nome: "tablete de caldo de carne", estaNaGeladeira: false),
            Ingrediente(nome: "tablete de caldo de tomate", estaNaGeladeira: false),
            Ingrediente(nome: "lata de creme de leite", estaNaGeladeira: false),
            Ingrediente(nome: "macarrão parafuso", estaNaGeladeira: false),
            Ingrediente(nome: "arroz japonês", estaNaGeladeira: false),
            Ingrediente(nome: "água", estaNaGeladeira: false),
            Ingrediente(nome: "shoyu", estaNaGeladeira: false),
            Ingrediente(nome: "tempero à base de peixe bonito", estaNaGeladeira: false),
            Ingrediente(nome: "carne moída", estaNaGeladeira: false),
            Ingrediente(nome: "cenoura cortada em tiras no sentido do comprimento", estaNaGeladeira: false),
            Ingrediente(nome: "vagem", estaNaGeladeira: false),
            Ingrediente(nome: "alga", estaNaGeladeira: false),
            Ingrediente(nome: "berinjelas em rodelas", estaNaGeladeira: false),
            Ingrediente(nome: "vinagre", estaNaGeladeira: false),
            Ingrediente(nome: "abobrinhas", estaNaGeladeira: false),
            Ingrediente(nome: "pimentão verde em rodelas", estaNaGeladeira: false),
            Ingrediente(nome: "óleo de soja", estaNaGeladeira: false),
            Ingrediente(nome: "ovo de galinha", estaNaGeladeira: false),
            Ingrediente(nome: "sal", estaNaGeladeira: false),
            Ingrediente(nome: "alho", estaNaGeladeira: false),
            Ingrediente(nome: "caldo de carne", estaNaGeladeira: false),
            Ingrediente(nome: "caldo de carne", estaNaGeladeira: false),
            Ingrediente(nome: "creme de leite sem soro", estaNaGeladeira: false),
            Ingrediente(nome: "batatas pré-cozidas picadas", estaNaGeladeira: false),
            Ingrediente(nome: "cebola fatiada", estaNaGeladeira: false),
            Ingrediente(nome: "alface americana", estaNaGeladeira: false),
            Ingrediente(nome: "cenouras raladas", estaNaGeladeira: false),
            Ingrediente(nome: "tomate sem pele", estaNaGeladeira: false),
            Ingrediente(nome: "cebola cortada", estaNaGeladeira: false)
        ]
        self.comidasPaises = [EnumComidasPaises.japonesa.rawValue, EnumComidasPaises.francesa.rawValue, EnumComidasPaises.italina.rawValue]
        self.recitasFavoritadas = []
        self.receitas = []
        loadReceitas()
    }
    
    func loadReceitas() {
        receitas = [
            Receita(modoDePreparo: "1.Tempere a carne a gosto e deixe que ela cozinhe com a própria água. \n 2.Adicione o caldo de carne e o de tomate, deixe a carne cozinhar até secar toda a água e acrescente o molho de tomate. \n 3.Aguarde levantar fervura, despeje o macarrão e misture bem. \n 4.Despeje água até cobrir todo o macarrão e coloque a tampa na panela de pressão. \n 5.Após o início da pressão, desligue a panela, tire a pressão, misture o creme de leite e coloque em um refratário. \n 6.Está pronto para servir!",
                    nome: "Macarrão da panela de pressão",
                    tempoDeDuracao: "20 minutos", image: Image("macarrao"),
                    notaDoAutor: 4.6,
                    ingredientes: [ingredientes[0],ingredientes[9], ingredientes[1], ingredientes[2], ingredientes[3], ingredientes[4]],
                    quantidade: ["1","1/2 Quilo", "1", "1", "1", "1 pacote"],
                    categoria: EnumComidasPaises.italina.rawValue
                   ),
            Receita(modoDePreparo: "1.Em uma panela colocar o arroz e a água e levar ao fogo para cozinhar. \n 2.Quando levantar fervura, mexer e deixar cozinhar em fogo brando. \n 3.Misturar todos os ingredientes em uma tigela, misturando aos poucos, ao arroz cozido. \n 4.Ir experimentando para ver o tempero. \n 5.Reservar cerca de 1 colher (sopa) do tempero para fechar os sushis. \n  5.Colocar todos os ingredientes do sushi de verduras em uma panela, exceto o gengibre e deixar cozinhar até ficarem macios. \n 6.Desligue o fogo e escorra - os. \n 7.Com a ajuda de uma esteira própria para enrolar sushi, coloque o nori, com o lado que brilha voltado para dentro (onde se colocará o arroz). \n 8.Preencher o nori com o arroz, que deverá estar frio. \n 9.Deixar dois dedos do nori sem preencher com o arroz. \n 10.Bem no centro colocar 2 tiras de cenoura, 2 tiras de vagem e tirinhas de gengibre (1 fileira). \n 11.Passar um pouquinho do tempero que usou para o arroz no local do nori onde não foi preenchido com o arroz. \n 12.Enrolar do sentido de onde está o arroz para o sentido da onde não foi colocado o arroz, para que grude. \n 13.Tire a esteirinha e corte os sushis, com espessura de cerca de 2 dedos cada um.",
                    nome: "Sushi",
                    tempoDeDuracao: "120 minutos", image: Image("sushi"),
                    notaDoAutor: 4.7,
                    ingredientes: [ingredientes[5],ingredientes[6], ingredientes[7], ingredientes[8], ingredientes[10], ingredientes[11], ingredientes[12]],
                    quantidade: ["2 xícaras (chá)","2 xícaras (chá)", "1/4 xícara", "1 saquinho", "1", "15" ],
                    categoria: EnumComidasPaises.japonesa.rawValue
                   ),
            Receita(modoDePreparo: "1.Corte a berinjela em rodelas finas e deixe de molho numa bacia com água e vinagre durante 15 minutos \n 2.Coloque o óleo na panela e deixe aquecer. \n 3.Grelhe os legumes (coloque poucas rodelas por vez na frigideira e tenha cuidado para não amolecer muito) \n 4.Nessa mesma frigideira, aqueça 1 colher (sopa) de azeite e refogue a cebola e o alho.\n 5.Adicione os tomates picados, o louro e os temperos restantes. \n 6.Cozinhe em fogo baixo até que o molho tomate ganhe consistência. \n 7.Em uma travessa, cubra o fundo com o molho de tomate e arrume as fatias de legumes, intercalando-as \n 8.Cubra com papel-alumínio e leve ao forno (200° C) por 30 minutos",
                    nome: "Ratatouille",
                    tempoDeDuracao: "60 minutos", image: Image("ratatouille"),
                    notaDoAutor: 4.7,
                    ingredientes: [ingredientes[13], ingredientes[6], ingredientes[14], ingredientes[15], ingredientes[16]],
                    quantidade: ["6", "200ml", "4 colheres (sopa)", "6", "2"],
                    categoria: EnumComidasPaises.francesa.rawValue),
            Receita(modoDePreparo: "1.Coloque o óleo na panela e espere até que fique bem quente. \n 2.Em seguida pegue o ovo e quebre a casca bem devagar na quina do fogão. \n 3.Coloque o conteúdo do ovo no óleo quente e espere até que ele fique com a clara bem branca. \n 4.Em seguida vire-o e espere até que ele fique bem frito por baixo. \n 5.Com uma colher apropriada, retire-o da panela com cuidado para não estourá-lo. \n 6.Coloque uma pitada de sal e sirva-se.", nome: "Ovo Frito", tempoDeDuracao: "5 minutos", image: Image("ovofrito"), notaDoAutor: 5.0, ingredientes: [ingredientes[17], ingredientes[18], ingredientes[19]], quantidade: ["3 colheres", "1", "1 pitada"], categoria: EnumComidasPaises.francesa.rawValue),
            Receita(modoDePreparo: "1.Refogar na manteiga o alho, a cebola e as batatas. \n 2.Dissolver em 2 colheres de água fria o caldo de carne, sal, pimenta e farinha de trigo. \n 3.Juntar tudo mais a água fervente e cozinhar por 20 minutos. \n 4.Desligue o fogo e acrescente o creme de leite. \n 5.Bata tudo no liquidificador e leve ao fogo. \n 6.Antes de servir, polvilhe com salsa e queijo. Bom apetite.", nome: "Sopa de cebola", tempoDeDuracao: "40 minutos", image: Image("sopa"), notaDoAutor: 4.3, ingredientes: [ingredientes[20],ingredientes[21],ingredientes[22],ingredientes[23],ingredientes[24],ingredientes[25]], quantidade: ["1 dente", "1 tablete", "1 colher", "1/2 lata", "2", "400g"], categoria: EnumComidasPaises.italina.rawValue),
            Receita(modoDePreparo: "1.Lave bem todos os ingredientes. \n 2.Rasgue as folhas do alface para que fiquem menores. Rale as cenouras e a beterraba. O tomate, após estar sem pele e semente, deve ser picado. A cebola pode ser cortada em pedacinhos ou em rodelas, como preferir. Junte tudo.", nome: "Salada simples", tempoDeDuracao: "30 minutos", image: Image("salada"), notaDoAutor: 30, ingredientes: [ingredientes[26],ingredientes[27],ingredientes[28], ingredientes[29]], quantidade: ["1", "2", "1", "1", "1"], categoria: EnumComidasPaises.brasileira.rawValue)
        ]
        
    }
}
