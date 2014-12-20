SimpleForm.setup do |config|
  config.wrappers :cascade, tag: 'div', class: 'col cascade-actw-form', error_class: 'error' do |c|
    c.use :html5
    c.use :placeholder
    c.optional :maxlength
    c.optional :min_max
    c.optional :readonly
    c.optional :pattern

    c.wrapper :label, tag: 'div', class: 'col width-1of6' do |cc|
      cc.wrapper tag: 'div', class: 'cell' do |ccc|
        ccc.use :label
      end
    end

    c.wrapper tag: 'div', class: 'col width-fill' do |cc|
      cc.wrapper tag: 'div', class: 'cell' do |ccc|
        ccc.use :input, wrap_with: { tag: 'div', class: 'left-input' }

        ccc.wrapper tag: 'ul', class: 'parsley-error-list' do |cccc|
          cccc.use :error, wrap_with: { tag: 'li', class: 'custom-error-message' }
        end
      end
    end
  end
end
