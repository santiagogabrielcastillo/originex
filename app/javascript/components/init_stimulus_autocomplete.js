import { Application } from 'stimulus'
import { Autocomplete } from 'stimulus-autocomplete'


const initStimulusAutocomplete = () => {
  const application = Application.start()
  application.register('autocomplete', Autocomplete)
};

export { initStimulusAutocomplete };
