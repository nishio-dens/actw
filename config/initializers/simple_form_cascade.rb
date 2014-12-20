SimpleForm.setup do |config|
  config.wrappers :cascade, tag: 'div', class: 'col', error_class: 'error' do |c|
    c.use :html5
    c.use :placeholder

    c.wrapper :label, tag: 'div', class: 'col width-1of7' do |cc|
      cc.wrapper tag: 'div', class: 'cell' do |ccc|
        ccc.use :label
      end
    end

    c.wrapper tag: 'div', class: 'col width-fill' do |cc|
      cc.wrapper tag: 'div', class: 'cell' do |ccc|
        ccc.use :input

        ccc.wrapper tag: 'ul', class: 'parsley-error-list' do |cccc|
          cccc.use :error, wrap_with: { tag: 'li', class: 'custom-error-message' }
        end
      end
    end
  end
end
