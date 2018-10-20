import Footer from '../components/Footer';

describe('<Footer />', () => {
  it('renders without crashing', () => {
    const wrapper = shallow(<Footer />);
    expect(wrapper).toHaveLength(1);
  });
});
