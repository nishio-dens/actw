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
        ccc.wrapper tag: 'div', class: 'col width-3of4' do |cccc|
          cccc.use :input, wrap_with: { tag: 'div', class: 'cell left-input' }
        end

        ccc.wrapper tag: 'div', class: 'col width-fill' do |cccc|
          cccc.wrapper tag: 'div', class: 'cell' do |ccccc|
            ccccc.wrapper tag: 'ul', class: 'parsley-error-list' do |cccccc|
              cccccc.use :error, wrap_with: { tag: 'li', class: 'custom-error-message' }
            end
          end
        end
      end
    end
  end
end
