module ApplicationHelper
  def bootstrap_class_for flash_type
    {
      success: "alert-success",
      error: "alert-danger",
      recaptcha_error: "alert-danger",
      alert: "alert-warning",
      notice: "alert-info"
    }[flash_type.to_sym] || flash_type.to_s
  end

  def yes_no(b)
    b ? t('bool_yes') : t('bool_no')
  end

end
