require 'test_helper'

class TaxesControllerTest < ActionController::TestCase
  setup do
    @tax = taxes(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:taxes)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create tax" do
    assert_difference('Tax.count') do
      post :create, tax: { ahv: @tax.ahv, ahv_p: @tax.ahv_p, alv: @tax.alv, alv_p: @tax.alv_p, anrechnung_q: @tax.anrechnung_q, brutto: @tax.brutto, kirche_fw_float: @tax.kirche_fw_float, kurs: @tax.kurs, netto: @tax.netto, pk: @tax.pk, pk_p: @tax.pk_p, qsteuer: @tax.qsteuer, qsteuer_p: @tax.qsteuer_p, soli_fw: @tax.soli_fw, steuer_fw: @tax.steuer_fw, steuervoraus: @tax.steuervoraus, sum: @tax.sum, sum_fw: @tax.sum_fw, suva: @tax.suva, suva_f_p: @tax.suva_f_p, suva_m_p: @tax.suva_m_p, user_id: @tax.user_id }
    end

    assert_redirected_to tax_path(assigns(:tax))
  end

  test "should show tax" do
    get :show, id: @tax
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @tax
    assert_response :success
  end

  test "should update tax" do
    patch :update, id: @tax, tax: { ahv: @tax.ahv, ahv_p: @tax.ahv_p, alv: @tax.alv, alv_p: @tax.alv_p, anrechnung_q: @tax.anrechnung_q, brutto: @tax.brutto, kirche_fw_float: @tax.kirche_fw_float, kurs: @tax.kurs, netto: @tax.netto, pk: @tax.pk, pk_p: @tax.pk_p, qsteuer: @tax.qsteuer, qsteuer_p: @tax.qsteuer_p, soli_fw: @tax.soli_fw, steuer_fw: @tax.steuer_fw, steuervoraus: @tax.steuervoraus, sum: @tax.sum, sum_fw: @tax.sum_fw, suva: @tax.suva, suva_f_p: @tax.suva_f_p, suva_m_p: @tax.suva_m_p, user_id: @tax.user_id }
    assert_redirected_to tax_path(assigns(:tax))
  end

  test "should destroy tax" do
    assert_difference('Tax.count', -1) do
      delete :destroy, id: @tax
    end

    assert_redirected_to taxes_path
  end
end
