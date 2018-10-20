import { MemoryRouter } from 'react-router-dom';
import Button from '../components/Button';

describe('<Button />', () => {
  let wrapper;

  beforeEach(() => {
    wrapper = shallow(<Button />);
  });
  it('should render without crashing', () => {
    expect(wrapper).toHaveLength(1);
  });

  it('should render children', () => {
    wrapper.setProps({ children: 'child' });
    expect(wrapper.text()).toBe('child');
  });

  it('should add additional classes', () => {
    wrapper.setProps({ className: 'extra' });
    expect(wrapper.find('.Btn').hasClass('extra')).toBeTruthy();
  });

  it('should add block class when given a prop', () => {
    wrapper.setProps({ block: true });
    expect(wrapper.find('.Btn').hasClass('Btn--block')).toBeTruthy();
  });
  it('should add loading class when given a prop', () => {
    wrapper.setProps({ loading: true });
    expect(wrapper.find('.Btn').hasClass('Btn--loading')).toBeTruthy();
  });

  it('should add outline class when given a prop', () => {
    wrapper.setProps({ outline: true });
    expect(wrapper.find('.Btn').hasClass('Btn--outline-primary')).toBeTruthy();
  });

  it('should add rounded class when given a prop', () => {
    wrapper.setProps({ rounded: true });
    expect(wrapper.find('.Btn').hasClass('Btn--rounded')).toBeTruthy();
  });

  it('should add a color class when given a prop', () => {
    wrapper.setProps({ color: 'secondary' });
    expect(wrapper.find('.Btn').hasClass('Btn--secondary')).toBeTruthy();
  });

  it('should add link class when given a prop', () => {
    wrapper.setProps({ link: true });
    expect(wrapper.find('.Btn').hasClass('Btn--link')).toBeTruthy();
  });

  it('should change button type if has "type" prop', () => {
    wrapper.setProps({ type: 'submit' });
    expect(wrapper.find('.Btn').props()).toHaveProperty('type', 'submit');
  });

  it('should render a link if has "to" prop', () => {
    wrapper = mount(
      <MemoryRouter location="/">
        <Button to="/" />
      </MemoryRouter>
    );
    expect(wrapper.find('a').type()).toBe('a');
  });

  it('should be disabled if has "disabled" prop', () => {
    wrapper.setProps({ disabled: true });
    expect(wrapper.find('.Btn').props()).toHaveProperty('disabled');
  });

  describe('onClick', () => {
    it('should call onClick callback', () => {
      const mockCallback = jest.fn();
      wrapper = shallow(<Button onClick={mockCallback}>Test</Button>);
      wrapper.simulate('click');
      expect(mockCallback).toHaveBeenCalledTimes(1);
    });
    it('should not call onClick callback if disabled', () => {
      const mockCallback = jest.fn();
      wrapper = shallow(<Button disabled onClick={mockCallback} />);
      wrapper.simulate('click', { preventDefault: () => {} });
      expect(mockCallback).toHaveBeenCalledTimes(0);
    });
  });
});
