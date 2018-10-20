import Card from '../components/Card';

describe('<Card />', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(<Card />);
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
    expect(wrapper.find('.Card').hasClass('my-class')).toBeTruthy();
  });

  it('renders center class when given a prop', () => {
    wrapper.setProps({ center: true });
    expect(wrapper.hasClass('Card--center')).toBeTruthy();
  });
});
