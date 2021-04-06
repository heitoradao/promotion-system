class IuguDomainValidator < ActiveModel::Validator
  def validate(record)
    unless record.email.end_with?('@iugu.com.br')
      record.errors.add :email, "This domain is not authorized."
    end
  end
end
