require 'pagy/extras/bootstrap'
require 'pagy/extras/i18n'
Pagy::DEFAULT.freeze

Pagy::I18n.load({ locale: 'de' },
                { locale: 'en' })

# Optionally override some pagy default with your own in the pagy initializer
# Pagy::DEFAULT[:items] = 10        # items per page
# Pagy::DEFAULT[:size]  = [1,4,4,1] # nav bar links
# Better user experience handled automatically
# require 'pagy/extras/overflow'
# Pagy::DEFAULT[:overflow] = :last_page