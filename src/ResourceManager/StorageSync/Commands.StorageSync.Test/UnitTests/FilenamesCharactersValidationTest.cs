﻿using Microsoft.Azure.Commands.StorageSync.Evaluation;
using Xunit;
using System.Collections.Generic;
using Microsoft.Azure.Commands.StorageSync.Evaluation.Validations;
using Microsoft.Azure.Commands.StorageSync.Evaluation.Validations.NamespaceValidations;
using Microsoft.Azure.Commands.StorageSync.Evaluation.Interfaces;

namespace Microsoft.Azure.Commands.StorageSync.Test.UnitTests
{
    public class FilenamesCharactersValidationTest
    {
        IConfiguration _configuration = new Configuration();

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void ItReturnsErrorOnDirectoryWithInvalidCodePoint()
        {
            var configurationMockFactory = new Moq.Mock<IConfiguration>();
            List<int> codePointBlacklist = new List<int>
            {
                0x7A
            };
            configurationMockFactory.Setup(configuration => configuration.BlacklistOfCodePoints()).Returns(codePointBlacklist);
            configurationMockFactory.Setup(configuration => configuration.WhitelistOfCodePointRanges()).Returns(this._configuration.WhitelistOfCodePointRanges);
            FilenamesCharactersValidation validation = new FilenamesCharactersValidation(configurationMockFactory.Object);

            var directoryInfoMockFactory = new Moq.Mock<IDirectoryInfo>();
            directoryInfoMockFactory.SetupGet(directoryInfo => directoryInfo.Name).Returns("AAAzAAA");

            IValidationResult validationResult = validation.Validate(directoryInfoMockFactory.Object);

            Assert.StrictEqual<Result>(Result.Fail, validationResult.Result);
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void ItReturnsErrorOnFileWithInvalidCodePoint()
        {
            var configurationMockFactory = new Moq.Mock<IConfiguration>();
            List<int> codePointBlacklist = new List<int>
            {
                0x7A
            };
            configurationMockFactory.Setup(configuration => configuration.BlacklistOfCodePoints()).Returns(codePointBlacklist);
            configurationMockFactory.Setup(configuration => configuration.WhitelistOfCodePointRanges()).Returns(this._configuration.WhitelistOfCodePointRanges);
            FilenamesCharactersValidation validation = new FilenamesCharactersValidation(configurationMockFactory.Object);

            var fileInfoMockFactory = new Moq.Mock<IFileInfo>();
            fileInfoMockFactory.SetupGet(fileInfo => fileInfo.Name).Returns("AAAzAAA");

            IValidationResult validationResult = validation.Validate(fileInfoMockFactory.Object);

            Assert.StrictEqual<Result>(Result.Fail, validationResult.Result);
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void ItReturnsErrorWhenCodePointIsInBoundsOfRange()
        {
            var configurationMockFactory = new Moq.Mock<IConfiguration>();
            List<Configuration.CodePointRange> whitelist = new List<Configuration.CodePointRange> {
                new Configuration.CodePointRange {
                    Start = 0x00, 
                    End = 0x77    // x - 1
                },
                new Configuration.CodePointRange {
                    Start = 0x7B, // z + 1
                    End = 0x10FFFF
                },
            };
            configurationMockFactory.Setup(configuration => configuration.WhitelistOfCodePointRanges()).Returns(whitelist);
            configurationMockFactory.Setup(configuration => configuration.BlacklistOfCodePoints()).Returns(new List<int>());
            FilenamesCharactersValidation validation = new FilenamesCharactersValidation(configurationMockFactory.Object);

            var fileInfoMockFactory = new Moq.Mock<IFileInfo>();
            fileInfoMockFactory.SetupGet(fileInfo => fileInfo.Name).Returns("AAAxAAAzAAA");
            IValidationResult validationResult = validation.Validate(fileInfoMockFactory.Object);

            Assert.StrictEqual<Result>(Result.Fail, validationResult.Result);
            Assert.True(validationResult.Positions.Count == 2, $"Unexpected number of error positions");
            Assert.True(validationResult.Positions[0] == 4, $"Unexpected position of first error");
            Assert.True(validationResult.Positions[1] == 8, $"Unexpected position of second error");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void ItReturnsErrorWhenCodePointIsInMiddleOfRange()
        {
            var configurationMockFactory = new Moq.Mock<IConfiguration>();
            List<Configuration.CodePointRange> whitelist = new List<Configuration.CodePointRange> {
                new Configuration.CodePointRange {
                    Start = 0x00,
                    End = 0x77    // x - 1
                },
                new Configuration.CodePointRange {
                    Start = 0x7B, // z + 1
                    End = 0x10FFFF
                },
            };

            configurationMockFactory.Setup(configuration => configuration.WhitelistOfCodePointRanges()).Returns(whitelist);
            configurationMockFactory.Setup(configuration => configuration.BlacklistOfCodePoints()).Returns(new List<int>());
            FilenamesCharactersValidation validation = new FilenamesCharactersValidation(configurationMockFactory.Object);

            var fileInfoMockFactory = new Moq.Mock<IFileInfo>();
            fileInfoMockFactory.SetupGet(fileInfo => fileInfo.Name).Returns("AAAyAAA");
            IValidationResult validationResult = validation.Validate(fileInfoMockFactory.Object);

            Assert.StrictEqual<Result>(Result.Fail, validationResult.Result);
            Assert.True(validationResult.Positions.Count == 1, $"Unexpected number of error positions");
            Assert.True(validationResult.Positions[0] == 4, $"Unexpected position of first error");
        }

        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestWithRealConfigReturnsSuccessForValidSurrogateCodePoint()
        {
            FilenamesCharactersValidation validation = new FilenamesCharactersValidation(this._configuration);

            var fileInfoMockFactory = new Moq.Mock<IFileInfo>();

            fileInfoMockFactory.SetupGet(fileInfo => fileInfo.Name).Returns(new string(new char[] { 'a', (char)0xD834, (char)0xDD1E, 'z' }));
            IValidationResult validationResult = validation.Validate(fileInfoMockFactory.Object);

            Assert.StrictEqual<Result>(Result.Success, validationResult.Result);
        }


        [Fact]
        [Trait(Category.AcceptanceType, Category.CheckIn)]
        public void TestWithRealConfigReturnsErrorForInvalidCodePoint()
        {
            FilenamesCharactersValidation validation = new FilenamesCharactersValidation(this._configuration);

            var fileInfoMockFactory = new Moq.Mock<IFileInfo>();
            fileInfoMockFactory.SetupGet(fileInfo => fileInfo.Name).Returns(new string(new char[] {
                'a',
                (char)0xD834, (char)0xDD1E, // valid surrogate pair
                (char)0xFFF0, // invalid codepoint
                'z',
                (char)0x007C // blacklisted codepoint
            }));
            IValidationResult validationResult = validation.Validate(fileInfoMockFactory.Object);

            Assert.StrictEqual<Result>(Result.Fail, validationResult.Result);
            Assert.True(validationResult.Positions.Count == 2, $"Unexpected number of error positions");
            Assert.True(validationResult.Positions[0] == 3, $"Unexpected position of first error");
            Assert.True(validationResult.Positions[1] == 5, $"Unexpected position of second error");
        }

    }
}
