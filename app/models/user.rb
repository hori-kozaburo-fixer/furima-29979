class User < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :nickname, :name_first, :name_last, :name_first_kana, :name_last_kana, :birth_day presence: true

  
  
  def birth_day
    self.data = [
    {id:1, name: '--'},{id:2, name: '1933'},{id:3, name: '1934'},
    {id:4, name: '1935'},{id:5, name: '1936'},{id:6, name: '1937'},
    {id:7, name: '1938'},{id:8, name: '1939'},{id:9, name: '1940'},{id:10, name: '1941'},{id:11, name: '1942'},{id:12, name: '1943'},{id:13, name: '1944'},{id:14, name: '1945'},{id:15, name: '1946'},{id:16, name: '1947'},{id:17, name: '1948'},{id:18, name: '1949'},{id:19, name: '1950'},{id:20, name: '1951'},{id:21, name: '1952'},{id:22, name: '1953'},{id:23,name: '1954'},{id:24, name: '1955'},{id:25, name: '1956'},{id:26, name: '1957'},{id:27, name: '1958'},{id:28, name: '1959'},{id:29, name: '1960'},{id:30, name: '1961'},{id:31, name: '1962'},{id:32, name: '1963'},{id:33, name: '1964'},{id:34, name: '1965'},{id:35, name: '1966'},{id:36, name: '1967'},{id:37, name: '1968'},{id:38, name: '1969'},{id:39, name: '1970'},{id:40, name: '1971'},{id:41, name: '1972'},{id:42, name: '1973'},{id:43, name: '1974'},{id:44, name: '1975'},{id:45, name: '1976'},{id:46, name: '1977'},{id:47, name: '1978'},{id:48, name: '1979'},{id:49, name: '1980'},{id:50, name: '1981'},{id:51, name: '1982'},{id:52, name: '1983'},{id:53, name: '1984'},{id:54, name: '1985'},{id:55, name: '1986'},{id:56, name: '1987'},{id:57, name: '1988'},{id:58, name: '1989'},{id:59, name: '1990'},{id:60, name: '1991'},{id:61, name: '1992'},{id:62, name: '1993'},{id:63, name: '1994'},{id:64, name: '1995'},{id:65, name: '1996'},{id:66, name: '1997'},{id:67, name: '1998'},{id:68, name: '1999'},{id:69, name: '2000'},{id:70, name: '2001'},{id:71, name: '2002'},{id:72, name: '2003'},{id:73, name: '2004'},{id:74, name: '2005'},{id:75, name: '2006'},{id:76, name: '2007'},{id:77, name: '2008'},{id:78, name: '2009'},{id:79, name: '2010'},{id:80, name: '2011'},{id:81, name: '2012'},{id:82, name: '2013'},{id:83, name: '2014'},{id:84, name: '2015'}
    ]
  end

  def birty_month
    self.data = [
      {id:1, name: '--'},{id:2, name: '1'},{id:3, name: '2'},{id:4, name: '3'},{id:5, name: '4'},{id:6, name: '5'},{id:7, name: '6'},{id:8, name: '7'},{id:9, name: '8'},{id:10, name: '9'},{id:11, name: '10'},{id:12, name: '11'},{id:13, name: '12'}
    ]
  end

  def birth_day
    self.data = [
      {id:1, name: '--'},{id:2, name: '1'},{id:3, name: '2'},{id:4, name: '3'},{id:5, name: '4'},{id:6, name: '5'},{id:7, name: '6'},{id:8, name: '7'},{id:9, name: '8'},{id:10, name: '9'},{id:11, name: '10'},{id:12, name: '11'},{id:13, name: '12'},{id:14, name: '13'},{id:15, name: '14'},{id:16, name: '15'},
      {id:17, name: '16'},{id:18, name: '17'},{id:19, name: '18'},{id:20, name: '19'},{id:21, name: '20'},{id:22, name: '21'},{id:23, name: '22'},{id:24, name: '23'},{id:25, name: '24'},{id:26, name: '25'},{id:27, name: '26'},{id:28, name: '27'},{id:29, name: '28'},{id:30, name: '29'},{id:31, name: '30'},{id:32, name: '31'}
    ]
  end
end

  
  
