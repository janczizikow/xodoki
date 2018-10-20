import { Container } from '../components/Grid';

describe('<Container />', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(<Container />);
  });

  it('renders without crashing', () => {
    expect(wrapper).toHaveLength(1);
  });

  it('renders children', () => {
    wrapper.setProps({ children: 'child' });
    expect(wrapper.text()).toBe('child');
  });

  it('renders custom Tag', () => {
    wrapper.setProps({ tag: 'section' });
    expect(wrapper.type()).toBe('section');
  });

  it('renders additional classNames', () => {
    wrapper.setProps({ className: 'my-class' });
    expect(wrapper.find('.Container').hasClass('my-class')).toBeTruthy();
  });
});
