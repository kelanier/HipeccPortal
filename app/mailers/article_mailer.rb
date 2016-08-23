class ArticleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.new_article.subject
  #
  def new_article(article)
    @article = article
    @article_creator = User.find_by_id(@article.user_id)
    #@ennovar_hpc_admin = User.find_by_username("EnnovarHPC.Admin")
    mail(to: ENV["ENNOVAR_HPC_GMAIL_EMAIL"], subject: "Ennovar HPC request for #{@article.title}")
    mail(to: "Kyle.Lanier@Wichita.edu", subject: "Ennovar HPC request for #{@article.title}")
    mail(to: "Joel.Hatcher@Wichita.edu", subject: "Ennovar HPC request for #{@article.title}")
    mail(to: "thomas.rose@Wichita.edu", subject: "Ennovar HPC request for #{@article.title}")
  end
end
