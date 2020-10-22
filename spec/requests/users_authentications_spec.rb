describe 'GET #edit' do
    subject { get edit_user_registration_path }
    context 'ログインしている場合' do
      before do
        user = FactoryBot.create(:user)
        sign_in user
      end
      it 'リクエストが成功すること' do
        is_expected.to eq 200
      end
    end
    context 'ゲストの場合' do
      it 'リダイレクトされること' do
        is_expected.to redirect_to new_user_session_path
      end
    end
  end
