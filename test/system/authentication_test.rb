require 'application_system_test_case'

class AuthenticationTest < ApplicationSystemTestCase
  test 'user sign up' do
    # arrange

    # act
    visit root_path
    click_on 'Cadastrar'
    fill_in 'Email', with: 'jane.doe@iugu.com.br'
    fill_in 'Senha', with: 'password'
    # fill_in 'Confirmar senha', with: 'password'
    click_on 'Cadastrar'

    assert_text 'sucesso'
  end
end
