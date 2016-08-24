class ArticleMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.article_mailer.new_article.subject
  #
  def new_article(article)
    @article = article
    @article_creator = User.find_by_id(@article.user_id)
    mail(to: ENV["ENNOVAR_HPC_GMAIL_EMAIL"], subject: "Ennovar HPC request for #{@article.title}")
  end
end
