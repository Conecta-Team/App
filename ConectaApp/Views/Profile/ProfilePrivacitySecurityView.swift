//
//  ProfilePrivacitySecurityView.swift
//  ConectaApp
//
//  Created by Helaine Pontes on 12/11/21.
//

import UIKit

class ProfilePrivacitySecurityView: UIView {
    
    internal lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    internal lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    internal lazy var borderView: UIView = {
        let view = UIView()
        view.backgroundColor = .backgroundPurple
        view.layer.borderColor = UIColor.borderPurple.cgColor
        view.layer.borderWidth = 2
        view.layer.shadowColor = UIColor.borderPurple.cgColor
        view.layer.shadowRadius = 8
        view.layer.shadowOpacity = 1
        view.layer.shadowOffset = .zero
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    internal lazy var title: UILabel = {
        let label = UILabel()
        label.attributedText = NSMutableAttributedString(string: "Privacidade e Segurança", attributes: [
            NSAttributedString.Key.strokeWidth: -2,
            NSAttributedString.Key.font: UIFont.appRegularFont(with: 24)])
        label.textColor = .textBlue
        label.layer.shadowColor = UIColor.textBlue.cgColor
        label.layer.shadowRadius = 8
        label.layer.shadowOpacity = 1
        label.layer.shadowOffset = .zero
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var subtitle: UILabel = {
        let label = UILabel()
        label.text =
        """
        A sua privacidade é importante para nós. É política do Conecta respeitar a sua privacidade em relação a qualquer informação sua que possamos coletar no site Conecta, e outros sites que possuímos e operamos.
        
        Solicitamos informações pessoais apenas quando realmente precisamos delas para lhe fornecer um serviço. Fazemo-lo por meios justos e legais, com o seu conhecimento e consentimento. Também informamos por que estamos coletando e como será usado.

        Apenas retemos as informações coletadas pelo tempo necessário para fornecer o serviço solicitado. Quando armazenamos dados, protegemos dentro de meios comercialmente aceitáveis para evitar perdas e roubos, bem como acesso, divulgação, cópia, uso ou modificação não autorizados.

        Não compartilhamos informações de identificação pessoal publicamente ou com terceiros, exceto quando exigido por lei.

        O nosso aplicativo pode ter links para sites externos que não são operados por nós. Esteja ciente de que não temos controle sobre o conteúdo e práticas desses sites e não podemos aceitar responsabilidade por suas respectivas políticas de privacidade.

        Você é livre para recusar a nossa solicitação de informações pessoais, entendendo que talvez não possamos fornecer alguns dos serviços desejados.

        O uso continuado de nosso site será considerado como aceitação de nossas práticas em torno de privacidade e informações pessoais. Se você tiver alguma dúvida sobre como lidamos com dados do usuário e informações pessoais, entre em contacto connosco.

        Compromisso do Usuário
        O usuário se compromete a fazer uso adequado dos conteúdos e da informação que o Conecta oferece no site e com caráter enunciativo, mas não limitativo:

        a. Não se envolver em atividades que sejam ilegais ou contrárias à boa fé a à ordem pública;

        b. Não difundir propaganda ou conteúdo de natureza racista, xenofóbica, ou casas de apostas (ex.: Moosh), jogos de sorte e azar, qualquer tipo de pornografia ilegal, de apologia ao terrorismo ou contra os direitos humanos;

        c. Não causar danos aos sistemas físicos (hardwares) e lógicos (softwares) do Conecta, de seus fornecedores ou terceiros, para introduzir ou disseminar vírus informáticos ou quaisquer outros sistemas de hardware ou software que sejam capazes de causar danos anteriormente mencionados.

        Esta política é efetiva a partir de September/2021.

        TERMOS DE USO
        
        1. Termos
        Ao acessar ao aplicativo Conecta, concorda em cumprir estes termos de serviço, todas as leis e regulamentos aplicáveis e concorda que é responsável pelo cumprimento de todas as leis locais aplicáveis. Se você não concordar com algum desses termos, está proibido de usar ou acessar este site. Os materiais contidos neste site são protegidos pelas leis de direitos autorais e marcas comerciais aplicáveis.

        2. Uso de Licença
        É concedida permissão para baixar temporariamente uma cópia dos materiais (informações ou software) no site Conecta , apenas para visualização transitória pessoal e não comercial. Esta é a concessão de uma licença, não uma transferência de título e, sob esta licença, você não pode:

        a. modificar ou copiar os materiais;
        b. usar os materiais para qualquer finalidade comercial ou para exibição pública (comercial ou não comercial);
        c. tentar descompilar ou fazer engenharia reversa de qualquer software contido no site Conecta;
        d. remover quaisquer direitos autorais ou outras notações de propriedade dos materiais; ou
        e. transferir os materiais para outra pessoa ou ‘espelhe’ os materiais em qualquer outro servidor.
        Esta licença será automaticamente rescindida se você violar alguma dessas restrições e poderá ser rescindida por Conecta a qualquer momento. Ao encerrar a visualização desses materiais ou após o término desta licença, você deve apagar todos os materiais baixados em sua posse, seja em formato eletrónico ou impresso.

        3. Isenção de responsabilidade
        a. Os materiais no site da Conecta são fornecidos ‘como estão’. Conecta não oferece garantias, expressas ou implícitas, e, por este meio, isenta e nega todas as outras garantias, incluindo, sem limitação, garantias implícitas ou condições de comercialização, adequação a um fim específico ou não violação de propriedade intelectual ou outra violação de direitos.
        b. Além disso, o Conecta não garante ou faz qualquer representação relativa à precisão, aos resultados prováveis ou à confiabilidade do uso dos materiais em seu site ou de outra forma relacionado a esses materiais ou em sites vinculados a este site.
        
        4. Limitações
        Em nenhum caso o Conecta ou seus fornecedores serão responsáveis por quaisquer danos (incluindo, sem limitação, danos por perda de dados ou lucro ou devido a interrupção dos negócios) decorrentes do uso ou da incapacidade de usar os materiais em Conecta, mesmo que Conecta ou um representante autorizado da Conecta tenha sido notificado oralmente ou por escrito da possibilidade de tais danos. Como algumas jurisdições não permitem limitações em garantias implícitas, ou limitações de responsabilidade por danos conseqüentes ou incidentais, essas limitações podem não se aplicar a você.

        5. Precisão dos materiais
        Os materiais exibidos no site da Conecta podem incluir erros técnicos, tipográficos ou fotográficos. Conecta não garante que qualquer material em seu site seja preciso, completo ou atual. Conecta pode fazer alterações nos materiais contidos em seu site a qualquer momento, sem aviso prévio. No entanto, Conecta não se compromete a atualizar os materiais.

        6. Links
        O Conecta não analisou todos os sites vinculados ao seu site e não é responsável pelo conteúdo de nenhum site vinculado. A inclusão de qualquer link não implica endosso por Conecta do site. O uso de qualquer site vinculado é por conta e risco do usuário. Modificações O Conecta pode revisar estes termos de serviço do site a qualquer momento, sem aviso prévio. Ao usar este site, você concorda em ficar vinculado à versão atual desses termos de serviço.

        Lei aplicável

        Estes termos e condições são regidos e interpretados de acordo com as leis do Conecta e você se submete irrevogavelmente à jurisdição exclusiva dos tribunais naquele estado ou localidade.
        """
        label.font = .appRegularFont(with: 16)
        label.numberOfLines = 0
        label.textColor = .textLightBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    internal lazy var okButton: UIButton = {
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: "logoutButton"), for: .normal)
        button.setTitle("Entendi", for: .normal)
        button.titleLabel?.font = .appRegularFont(with: 20)
        button.contentEdgeInsets = UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8)
        button.layer.shadowColor = UIColor.actPink.cgColor
        button.layer.shadowRadius = 8
        button.layer.shadowOpacity = 1
        button.layer.shadowOffset = .zero
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setupView()
    }
    
    func setupView() {
        addSubview(borderView)
        addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(title)
        contentView.addSubview(subtitle)
        contentView.addSubview(okButton)
        
        configureConstraints()
    }
    
    func configureConstraints() {
        
        NSLayoutConstraint.activate([
            borderView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            borderView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            borderView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            borderView.bottomAnchor.constraint(equalTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -16)
        ])
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: borderView.topAnchor, constant: 4),
            scrollView.leadingAnchor.constraint(equalTo: borderView.leadingAnchor, constant: 4),
            scrollView.trailingAnchor.constraint(equalTo: borderView.trailingAnchor, constant: -4),
            scrollView.bottomAnchor.constraint(equalTo: borderView.bottomAnchor, constant: -4)
        ])
        
        NSLayoutConstraint.activate([
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])
        
        NSLayoutConstraint.activate([
            title.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 56),
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12)
        ])
        
        NSLayoutConstraint.activate([
            subtitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 16),
            subtitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12),
            subtitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -12),
            subtitle.bottomAnchor.constraint(equalTo: okButton.topAnchor, constant: -24)
        ])
        
        NSLayoutConstraint.activate([
            okButton.widthAnchor.constraint(equalTo: okButton.widthAnchor),
            okButton.heightAnchor.constraint(equalTo: okButton.heightAnchor),
            okButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
            okButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16)
        ])
    }
}
